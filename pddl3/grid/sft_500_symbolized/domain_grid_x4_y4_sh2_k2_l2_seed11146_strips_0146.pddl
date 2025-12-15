(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v5)
             (pred_7 ?v13 ?v7)
             (pred_8 ?v6 ?v7)
             (pred_11 ?v12 ?v6 )
	     (pred_10 ?v6)
             (pred_9 ?v4)
             (pred_5 ?v13)
             (pred_6 ?v7)
             (pred_1 ?v6)
             (pred_3 ?v13)
             (pred_2 ?v6)
             (pred_4 ))



(:action op_3
:parameters (?v8 ?v11 ?v10 ?v3)
:precondition (and (pred_9 ?v8) (pred_9 ?v11) (pred_5 ?v10) (pred_6 ?v3)
          (pred_12 ?v8 ?v11) (pred_7 ?v10 ?v3)
                   (pred_8 ?v11 ?v3) (pred_10 ?v8) 
                   (pred_1 ?v11) (pred_3 ?v10))
:effect (and  (pred_2 ?v11) (not (pred_1 ?v11))))


(:action op_2
:parameters (?v8 ?v9)
:precondition (and (pred_9 ?v8) (pred_9 ?v9)
               (pred_10 ?v8) (pred_12 ?v8 ?v9) (pred_2 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v8))))

(:action op_1
:parameters (?v8 ?v10)
:precondition (and (pred_9 ?v8) (pred_5 ?v10) 
                  (pred_10 ?v8) (pred_11 ?v10 ?v8) (pred_4 ))
:effect (and (pred_3 ?v10)
   (not (pred_11 ?v10 ?v8)) (not (pred_4 ))))


(:action op_4
:parameters (?v8 ?v2 ?v1)
:precondition (and (pred_9 ?v8) (pred_5 ?v2) (pred_5 ?v1)
                  (pred_10 ?v8) (pred_3 ?v1) (pred_11 ?v2 ?v8))
:effect (and (pred_3 ?v2) (pred_11 ?v1 ?v8)
        (not (pred_3 ?v1)) (not (pred_11 ?v2 ?v8))))

(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_9 ?v8) (pred_5 ?v10) 
                  (pred_10 ?v8) (pred_3 ?v10))
:effect (and (pred_4 ) (pred_11 ?v10 ?v8) (not (pred_3 ?v10)))))


	
