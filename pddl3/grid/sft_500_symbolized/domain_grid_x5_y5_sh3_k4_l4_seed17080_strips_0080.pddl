(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v1)
             (pred_1 ?v11 ?v9)
             (pred_12 ?v6 ?v9)
             (pred_4 ?v12 ?v6 )
	     (pred_10 ?v6)
             (pred_7 ?v4)
             (pred_8 ?v11)
             (pred_11 ?v9)
             (pred_5 ?v6)
             (pred_9 ?v11)
             (pred_2 ?v6)
             (pred_6 ))



(:action op_2
:parameters (?v8 ?v5 ?v3 ?v13)
:precondition (and (pred_7 ?v8) (pred_7 ?v5) (pred_8 ?v3) (pred_11 ?v13)
          (pred_3 ?v8 ?v5) (pred_1 ?v3 ?v13)
                   (pred_12 ?v5 ?v13) (pred_10 ?v8) 
                   (pred_5 ?v5) (pred_9 ?v3))
:effect (and  (pred_2 ?v5) (not (pred_5 ?v5))))


(:action op_1
:parameters (?v8 ?v7)
:precondition (and (pred_7 ?v8) (pred_7 ?v7)
               (pred_10 ?v8) (pred_3 ?v8 ?v7) (pred_2 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v8))))

(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_7 ?v8) (pred_8 ?v3) 
                  (pred_10 ?v8) (pred_4 ?v3 ?v8) (pred_6 ))
:effect (and (pred_9 ?v3)
   (not (pred_4 ?v3 ?v8)) (not (pred_6 ))))


(:action op_3
:parameters (?v8 ?v10 ?v2)
:precondition (and (pred_7 ?v8) (pred_8 ?v10) (pred_8 ?v2)
                  (pred_10 ?v8) (pred_9 ?v2) (pred_4 ?v10 ?v8))
:effect (and (pred_9 ?v10) (pred_4 ?v2 ?v8)
        (not (pred_9 ?v2)) (not (pred_4 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v3)
:precondition (and (pred_7 ?v8) (pred_8 ?v3) 
                  (pred_10 ?v8) (pred_9 ?v3))
:effect (and (pred_6 ) (pred_4 ?v3 ?v8) (not (pred_9 ?v3)))))


	
