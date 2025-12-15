(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v5 ?v10)
             (pred_12 ?v7 ?v1)
             (pred_9 ?v5 ?v1)
             (pred_11 ?v8 ?v5 )
	     (pred_6 ?v5)
             (pred_3 ?v11)
             (pred_8 ?v7)
             (pred_7 ?v1)
             (pred_5 ?v5)
             (pred_2 ?v7)
             (pred_4 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v12 ?v6 ?v4 ?v13)
:precondition (and (pred_3 ?v12) (pred_3 ?v6) (pred_8 ?v4) (pred_7 ?v13)
          (pred_10 ?v12 ?v6) (pred_12 ?v4 ?v13)
                   (pred_9 ?v6 ?v13) (pred_6 ?v12) 
                   (pred_5 ?v6) (pred_2 ?v4))
:effect (and  (pred_4 ?v6) (not (pred_5 ?v6))))


(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_3 ?v12) (pred_3 ?v2)
               (pred_6 ?v12) (pred_10 ?v12 ?v2) (pred_4 ?v2))
:effect (and (pred_6 ?v2) (not (pred_6 ?v12))))

(:action op_5
:parameters (?v12 ?v4)
:precondition (and (pred_3 ?v12) (pred_8 ?v4) 
                  (pred_6 ?v12) (pred_11 ?v4 ?v12) (pred_1 ))
:effect (and (pred_2 ?v4)
   (not (pred_11 ?v4 ?v12)) (not (pred_1 ))))


(:action op_1
:parameters (?v12 ?v3 ?v9)
:precondition (and (pred_3 ?v12) (pred_8 ?v3) (pred_8 ?v9)
                  (pred_6 ?v12) (pred_2 ?v9) (pred_11 ?v3 ?v12))
:effect (and (pred_2 ?v3) (pred_11 ?v9 ?v12)
        (not (pred_2 ?v9)) (not (pred_11 ?v3 ?v12))))

(:action op_3
:parameters (?v12 ?v4)
:precondition (and (pred_3 ?v12) (pred_8 ?v4) 
                  (pred_6 ?v12) (pred_2 ?v4))
:effect (and (pred_1 ) (pred_11 ?v4 ?v12) (not (pred_2 ?v4)))))


	
