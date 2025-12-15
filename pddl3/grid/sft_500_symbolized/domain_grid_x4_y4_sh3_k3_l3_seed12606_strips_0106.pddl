(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v13 ?v12)
             (pred_12 ?v2 ?v10)
             (pred_7 ?v13 ?v10)
             (pred_8 ?v9 ?v13 )
	     (pred_10 ?v13)
             (pred_2 ?v7)
             (pred_3 ?v2)
             (pred_11 ?v10)
             (pred_5 ?v13)
             (pred_1 ?v2)
             (pred_6 ?v13)
             (pred_9 ))



(:action op_1
:parameters (?v8 ?v11 ?v3 ?v5)
:precondition (and (pred_2 ?v8) (pred_2 ?v11) (pred_3 ?v3) (pred_11 ?v5)
          (pred_4 ?v8 ?v11) (pred_12 ?v3 ?v5)
                   (pred_7 ?v11 ?v5) (pred_10 ?v8) 
                   (pred_5 ?v11) (pred_1 ?v3))
:effect (and  (pred_6 ?v11) (not (pred_5 ?v11))))


(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_2 ?v8) (pred_2 ?v4)
               (pred_10 ?v8) (pred_4 ?v8 ?v4) (pred_6 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v8))))

(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_3 ?v3) 
                  (pred_10 ?v8) (pred_8 ?v3 ?v8) (pred_9 ))
:effect (and (pred_1 ?v3)
   (not (pred_8 ?v3 ?v8)) (not (pred_9 ))))


(:action op_2
:parameters (?v8 ?v1 ?v6)
:precondition (and (pred_2 ?v8) (pred_3 ?v1) (pred_3 ?v6)
                  (pred_10 ?v8) (pred_1 ?v6) (pred_8 ?v1 ?v8))
:effect (and (pred_1 ?v1) (pred_8 ?v6 ?v8)
        (not (pred_1 ?v6)) (not (pred_8 ?v1 ?v8))))

(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_3 ?v3) 
                  (pred_10 ?v8) (pred_1 ?v3))
:effect (and (pred_9 ) (pred_8 ?v3 ?v8) (not (pred_1 ?v3)))))


	
