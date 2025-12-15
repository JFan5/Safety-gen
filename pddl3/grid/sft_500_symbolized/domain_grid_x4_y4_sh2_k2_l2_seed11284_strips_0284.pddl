(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v6 ?v4)
             (pred_10 ?v9 ?v12)
             (pred_11 ?v6 ?v12)
             (pred_2 ?v10 ?v6 )
	     (pred_7 ?v6)
             (pred_9 ?v13)
             (pred_3 ?v9)
             (pred_12 ?v12)
             (pred_4 ?v6)
             (pred_8 ?v9)
             (pred_6 ?v6)
             (pred_5 ))



(:action op_5
:parameters (?v8 ?v5 ?v7 ?v11)
:precondition (and (pred_9 ?v8) (pred_9 ?v5) (pred_3 ?v7) (pred_12 ?v11)
          (pred_1 ?v8 ?v5) (pred_10 ?v7 ?v11)
                   (pred_11 ?v5 ?v11) (pred_7 ?v8) 
                   (pred_4 ?v5) (pred_8 ?v7))
:effect (and  (pred_6 ?v5) (not (pred_4 ?v5))))


(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_9 ?v8) (pred_9 ?v3)
               (pred_7 ?v8) (pred_1 ?v8 ?v3) (pred_6 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v8))))

(:action op_1
:parameters (?v8 ?v7)
:precondition (and (pred_9 ?v8) (pred_3 ?v7) 
                  (pred_7 ?v8) (pred_2 ?v7 ?v8) (pred_5 ))
:effect (and (pred_8 ?v7)
   (not (pred_2 ?v7 ?v8)) (not (pred_5 ))))


(:action op_2
:parameters (?v8 ?v1 ?v2)
:precondition (and (pred_9 ?v8) (pred_3 ?v1) (pred_3 ?v2)
                  (pred_7 ?v8) (pred_8 ?v2) (pred_2 ?v1 ?v8))
:effect (and (pred_8 ?v1) (pred_2 ?v2 ?v8)
        (not (pred_8 ?v2)) (not (pred_2 ?v1 ?v8))))

(:action op_4
:parameters (?v8 ?v7)
:precondition (and (pred_9 ?v8) (pred_3 ?v7) 
                  (pred_7 ?v8) (pred_8 ?v7))
:effect (and (pred_5 ) (pred_2 ?v7 ?v8) (not (pred_8 ?v7)))))


	
