(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v12)
             (pred_6 ?v2 ?v6)
             (pred_11 ?v1 ?v6)
             (pred_4 ?v10 ?v1 )
	     (pred_7 ?v1)
             (pred_12 ?v9)
             (pred_1 ?v2)
             (pred_5 ?v6)
             (pred_10 ?v1)
             (pred_8 ?v2)
             (pred_3 ?v1)
             (pred_9 ))



(:action op_5
:parameters (?v3 ?v8 ?v4 ?v13)
:precondition (and (pred_12 ?v3) (pred_12 ?v8) (pred_1 ?v4) (pred_5 ?v13)
          (pred_2 ?v3 ?v8) (pred_6 ?v4 ?v13)
                   (pred_11 ?v8 ?v13) (pred_7 ?v3) 
                   (pred_10 ?v8) (pred_8 ?v4))
:effect (and  (pred_3 ?v8) (not (pred_10 ?v8))))


(:action op_4
:parameters (?v3 ?v11)
:precondition (and (pred_12 ?v3) (pred_12 ?v11)
               (pred_7 ?v3) (pred_2 ?v3 ?v11) (pred_3 ?v11))
:effect (and (pred_7 ?v11) (not (pred_7 ?v3))))

(:action op_2
:parameters (?v3 ?v4)
:precondition (and (pred_12 ?v3) (pred_1 ?v4) 
                  (pred_7 ?v3) (pred_4 ?v4 ?v3) (pred_9 ))
:effect (and (pred_8 ?v4)
   (not (pred_4 ?v4 ?v3)) (not (pred_9 ))))


(:action op_1
:parameters (?v3 ?v5 ?v7)
:precondition (and (pred_12 ?v3) (pred_1 ?v5) (pred_1 ?v7)
                  (pred_7 ?v3) (pred_8 ?v7) (pred_4 ?v5 ?v3))
:effect (and (pred_8 ?v5) (pred_4 ?v7 ?v3)
        (not (pred_8 ?v7)) (not (pred_4 ?v5 ?v3))))

(:action op_3
:parameters (?v3 ?v4)
:precondition (and (pred_12 ?v3) (pred_1 ?v4) 
                  (pred_7 ?v3) (pred_8 ?v4))
:effect (and (pred_9 ) (pred_4 ?v4 ?v3) (not (pred_8 ?v4)))))


	
