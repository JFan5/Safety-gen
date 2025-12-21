(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v13)
             (pred_10 ?v12 ?v10)
             (pred_6 ?v8 ?v10)
             (pred_8 ?v5 ?v8 )
	     (pred_4 ?v8)
             (pred_7 ?v6)
             (pred_12 ?v12)
             (pred_5 ?v10)
             (pred_9 ?v8)
             (pred_3 ?v12)
             (pred_11 ?v8)
             (pred_2 ))



(:action op_1
:parameters (?v3 ?v4 ?v9 ?v11)
:precondition (and (pred_7 ?v3) (pred_7 ?v4) (pred_12 ?v9) (pred_5 ?v11)
          (pred_1 ?v3 ?v4) (pred_10 ?v9 ?v11)
                   (pred_6 ?v4 ?v11) (pred_4 ?v3) 
                   (pred_9 ?v4) (pred_3 ?v9))
:effect (and  (pred_11 ?v4) (not (pred_9 ?v4))))


(:action op_3
:parameters (?v3 ?v2)
:precondition (and (pred_7 ?v3) (pred_7 ?v2)
               (pred_4 ?v3) (pred_1 ?v3 ?v2) (pred_11 ?v2))
:effect (and (pred_4 ?v2) (not (pred_4 ?v3))))

(:action op_4
:parameters (?v3 ?v9)
:precondition (and (pred_7 ?v3) (pred_12 ?v9) 
                  (pred_4 ?v3) (pred_8 ?v9 ?v3) (pred_2 ))
:effect (and (pred_3 ?v9)
   (not (pred_8 ?v9 ?v3)) (not (pred_2 ))))


(:action op_5
:parameters (?v3 ?v7 ?v1)
:precondition (and (pred_7 ?v3) (pred_12 ?v7) (pred_12 ?v1)
                  (pred_4 ?v3) (pred_3 ?v1) (pred_8 ?v7 ?v3))
:effect (and (pred_3 ?v7) (pred_8 ?v1 ?v3)
        (not (pred_3 ?v1)) (not (pred_8 ?v7 ?v3))))

(:action op_2
:parameters (?v3 ?v9)
:precondition (and (pred_7 ?v3) (pred_12 ?v9) 
                  (pred_4 ?v3) (pred_3 ?v9))
:effect (and (pred_2 ) (pred_8 ?v9 ?v3) (not (pred_3 ?v9)))))


	
