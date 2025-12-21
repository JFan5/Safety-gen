(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v2)
             (pred_5 ?v1 ?v11)
             (pred_1 ?v6 ?v11)
             (pred_9 ?v4 ?v6 )
	     (pred_3 ?v6)
             (pred_12 ?v8)
             (pred_10 ?v1)
             (pred_4 ?v11)
             (pred_7 ?v6)
             (pred_8 ?v1)
             (pred_2 ?v6)
             (pred_6 ))



(:action op_1
:parameters (?v12 ?v5 ?v3 ?v9)
:precondition (and (pred_12 ?v12) (pred_12 ?v5) (pred_10 ?v3) (pred_4 ?v9)
          (pred_11 ?v12 ?v5) (pred_5 ?v3 ?v9)
                   (pred_1 ?v5 ?v9) (pred_3 ?v12) 
                   (pred_7 ?v5) (pred_8 ?v3))
:effect (and  (pred_2 ?v5) (not (pred_7 ?v5))))


(:action op_5
:parameters (?v12 ?v13)
:precondition (and (pred_12 ?v12) (pred_12 ?v13)
               (pred_3 ?v12) (pred_11 ?v12 ?v13) (pred_2 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v12))))

(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_12 ?v12) (pred_10 ?v3) 
                  (pred_3 ?v12) (pred_9 ?v3 ?v12) (pred_6 ))
:effect (and (pred_8 ?v3)
   (not (pred_9 ?v3 ?v12)) (not (pred_6 ))))


(:action op_2
:parameters (?v12 ?v7 ?v10)
:precondition (and (pred_12 ?v12) (pred_10 ?v7) (pred_10 ?v10)
                  (pred_3 ?v12) (pred_8 ?v10) (pred_9 ?v7 ?v12))
:effect (and (pred_8 ?v7) (pred_9 ?v10 ?v12)
        (not (pred_8 ?v10)) (not (pred_9 ?v7 ?v12))))

(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_12 ?v12) (pred_10 ?v3) 
                  (pred_3 ?v12) (pred_8 ?v3))
:effect (and (pred_6 ) (pred_9 ?v3 ?v12) (not (pred_8 ?v3)))))


	
