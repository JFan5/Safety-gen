(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v12)
             (pred_5 ?v3 ?v9)
             (pred_11 ?v10 ?v9)
             (pred_6 ?v5 ?v10 )
	     (pred_4 ?v10)
             (pred_7 ?v7)
             (pred_9 ?v3)
             (pred_12 ?v9)
             (pred_1 ?v10)
             (pred_10 ?v3)
             (pred_2 ?v10)
             (pred_8 ))



(:action op_3
:parameters (?v8 ?v13 ?v4 ?v11)
:precondition (and (pred_7 ?v8) (pred_7 ?v13) (pred_9 ?v4) (pred_12 ?v11)
          (pred_3 ?v8 ?v13) (pred_5 ?v4 ?v11)
                   (pred_11 ?v13 ?v11) (pred_4 ?v8) 
                   (pred_1 ?v13) (pred_10 ?v4))
:effect (and  (pred_2 ?v13) (not (pred_1 ?v13))))


(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_7 ?v8) (pred_7 ?v2)
               (pred_4 ?v8) (pred_3 ?v8 ?v2) (pred_2 ?v2))
:effect (and (pred_4 ?v2) (not (pred_4 ?v8))))

(:action op_2
:parameters (?v8 ?v4)
:precondition (and (pred_7 ?v8) (pred_9 ?v4) 
                  (pred_4 ?v8) (pred_6 ?v4 ?v8) (pred_8 ))
:effect (and (pred_10 ?v4)
   (not (pred_6 ?v4 ?v8)) (not (pred_8 ))))


(:action op_4
:parameters (?v8 ?v1 ?v6)
:precondition (and (pred_7 ?v8) (pred_9 ?v1) (pred_9 ?v6)
                  (pred_4 ?v8) (pred_10 ?v6) (pred_6 ?v1 ?v8))
:effect (and (pred_10 ?v1) (pred_6 ?v6 ?v8)
        (not (pred_10 ?v6)) (not (pred_6 ?v1 ?v8))))

(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_7 ?v8) (pred_9 ?v4) 
                  (pred_4 ?v8) (pred_10 ?v4))
:effect (and (pred_8 ) (pred_6 ?v4 ?v8) (not (pred_10 ?v4)))))


	
