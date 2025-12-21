(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v11)
             (pred_11 ?v8 ?v3)
             (pred_4 ?v6 ?v3)
             (pred_5 ?v10 ?v6 )
	     (pred_8 ?v6)
             (pred_2 ?v1)
             (pred_1 ?v8)
             (pred_10 ?v3)
             (pred_7 ?v6)
             (pred_6 ?v8)
             (pred_12 ?v6)
             (pred_9 ))



(:action op_2
:parameters (?v12 ?v7 ?v5 ?v2)
:precondition (and (pred_2 ?v12) (pred_2 ?v7) (pred_1 ?v5) (pred_10 ?v2)
          (pred_3 ?v12 ?v7) (pred_11 ?v5 ?v2)
                   (pred_4 ?v7 ?v2) (pred_8 ?v12) 
                   (pred_7 ?v7) (pred_6 ?v5))
:effect (and  (pred_12 ?v7) (not (pred_7 ?v7))))


(:action op_3
:parameters (?v12 ?v13)
:precondition (and (pred_2 ?v12) (pred_2 ?v13)
               (pred_8 ?v12) (pred_3 ?v12 ?v13) (pred_12 ?v13))
:effect (and (pred_8 ?v13) (not (pred_8 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_2 ?v12) (pred_1 ?v5) 
                  (pred_8 ?v12) (pred_5 ?v5 ?v12) (pred_9 ))
:effect (and (pred_6 ?v5)
   (not (pred_5 ?v5 ?v12)) (not (pred_9 ))))


(:action op_5
:parameters (?v12 ?v4 ?v9)
:precondition (and (pred_2 ?v12) (pred_1 ?v4) (pred_1 ?v9)
                  (pred_8 ?v12) (pred_6 ?v9) (pred_5 ?v4 ?v12))
:effect (and (pred_6 ?v4) (pred_5 ?v9 ?v12)
        (not (pred_6 ?v9)) (not (pred_5 ?v4 ?v12))))

(:action op_4
:parameters (?v12 ?v5)
:precondition (and (pred_2 ?v12) (pred_1 ?v5) 
                  (pred_8 ?v12) (pred_6 ?v5))
:effect (and (pred_9 ) (pred_5 ?v5 ?v12) (not (pred_6 ?v5)))))


	
