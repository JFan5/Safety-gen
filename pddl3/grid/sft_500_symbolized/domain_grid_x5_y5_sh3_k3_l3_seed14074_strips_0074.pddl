(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v1)
             (pred_11 ?v9 ?v11)
             (pred_4 ?v13 ?v11)
             (pred_5 ?v8 ?v13 )
	     (pred_3 ?v13)
             (pred_12 ?v4)
             (pred_10 ?v9)
             (pred_2 ?v11)
             (pred_6 ?v13)
             (pred_8 ?v9)
             (pred_9 ?v13)
             (pred_7 ))



(:action op_4
:parameters (?v12 ?v3 ?v6 ?v10)
:precondition (and (pred_12 ?v12) (pred_12 ?v3) (pred_10 ?v6) (pred_2 ?v10)
          (pred_1 ?v12 ?v3) (pred_11 ?v6 ?v10)
                   (pred_4 ?v3 ?v10) (pred_3 ?v12) 
                   (pred_6 ?v3) (pred_8 ?v6))
:effect (and  (pred_9 ?v3) (not (pred_6 ?v3))))


(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_12 ?v12) (pred_12 ?v2)
               (pred_3 ?v12) (pred_1 ?v12 ?v2) (pred_9 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v12))))

(:action op_3
:parameters (?v12 ?v6)
:precondition (and (pred_12 ?v12) (pred_10 ?v6) 
                  (pred_3 ?v12) (pred_5 ?v6 ?v12) (pred_7 ))
:effect (and (pred_8 ?v6)
   (not (pred_5 ?v6 ?v12)) (not (pred_7 ))))


(:action op_5
:parameters (?v12 ?v7 ?v5)
:precondition (and (pred_12 ?v12) (pred_10 ?v7) (pred_10 ?v5)
                  (pred_3 ?v12) (pred_8 ?v5) (pred_5 ?v7 ?v12))
:effect (and (pred_8 ?v7) (pred_5 ?v5 ?v12)
        (not (pred_8 ?v5)) (not (pred_5 ?v7 ?v12))))

(:action op_2
:parameters (?v12 ?v6)
:precondition (and (pred_12 ?v12) (pred_10 ?v6) 
                  (pred_3 ?v12) (pred_8 ?v6))
:effect (and (pred_7 ) (pred_5 ?v6 ?v12) (not (pred_8 ?v6)))))


	
