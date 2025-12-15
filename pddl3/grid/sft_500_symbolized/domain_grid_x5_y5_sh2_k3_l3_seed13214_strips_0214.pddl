(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v5)
             (pred_10 ?v9 ?v2)
             (pred_6 ?v11 ?v2)
             (pred_2 ?v6 ?v11 )
	     (pred_12 ?v11)
             (pred_8 ?v13)
             (pred_3 ?v9)
             (pred_4 ?v2)
             (pred_5 ?v11)
             (pred_11 ?v9)
             (pred_7 ?v11)
             (pred_9 ))



(:action op_3
:parameters (?v7 ?v3 ?v8 ?v1)
:precondition (and (pred_8 ?v7) (pred_8 ?v3) (pred_3 ?v8) (pred_4 ?v1)
          (pred_1 ?v7 ?v3) (pred_10 ?v8 ?v1)
                   (pred_6 ?v3 ?v1) (pred_12 ?v7) 
                   (pred_5 ?v3) (pred_11 ?v8))
:effect (and  (pred_7 ?v3) (not (pred_5 ?v3))))


(:action op_5
:parameters (?v7 ?v4)
:precondition (and (pred_8 ?v7) (pred_8 ?v4)
               (pred_12 ?v7) (pred_1 ?v7 ?v4) (pred_7 ?v4))
:effect (and (pred_12 ?v4) (not (pred_12 ?v7))))

(:action op_2
:parameters (?v7 ?v8)
:precondition (and (pred_8 ?v7) (pred_3 ?v8) 
                  (pred_12 ?v7) (pred_2 ?v8 ?v7) (pred_9 ))
:effect (and (pred_11 ?v8)
   (not (pred_2 ?v8 ?v7)) (not (pred_9 ))))


(:action op_1
:parameters (?v7 ?v10 ?v12)
:precondition (and (pred_8 ?v7) (pred_3 ?v10) (pred_3 ?v12)
                  (pred_12 ?v7) (pred_11 ?v12) (pred_2 ?v10 ?v7))
:effect (and (pred_11 ?v10) (pred_2 ?v12 ?v7)
        (not (pred_11 ?v12)) (not (pred_2 ?v10 ?v7))))

(:action op_4
:parameters (?v7 ?v8)
:precondition (and (pred_8 ?v7) (pred_3 ?v8) 
                  (pred_12 ?v7) (pred_11 ?v8))
:effect (and (pred_9 ) (pred_2 ?v8 ?v7) (not (pred_11 ?v8)))))


	
