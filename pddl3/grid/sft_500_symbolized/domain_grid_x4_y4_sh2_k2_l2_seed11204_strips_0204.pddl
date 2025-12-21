(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v3)
             (pred_7 ?v12 ?v10)
             (pred_12 ?v9 ?v10)
             (pred_6 ?v11 ?v9 )
	     (pred_8 ?v9)
             (pred_5 ?v2)
             (pred_11 ?v12)
             (pred_2 ?v10)
             (pred_9 ?v9)
             (pred_4 ?v12)
             (pred_10 ?v9)
             (pred_3 ))



(:action op_4
:parameters (?v8 ?v5 ?v1 ?v7)
:precondition (and (pred_5 ?v8) (pred_5 ?v5) (pred_11 ?v1) (pred_2 ?v7)
          (pred_1 ?v8 ?v5) (pred_7 ?v1 ?v7)
                   (pred_12 ?v5 ?v7) (pred_8 ?v8) 
                   (pred_9 ?v5) (pred_4 ?v1))
:effect (and  (pred_10 ?v5) (not (pred_9 ?v5))))


(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_5 ?v8) (pred_5 ?v4)
               (pred_8 ?v8) (pred_1 ?v8 ?v4) (pred_10 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v8))))

(:action op_1
:parameters (?v8 ?v1)
:precondition (and (pred_5 ?v8) (pred_11 ?v1) 
                  (pred_8 ?v8) (pred_6 ?v1 ?v8) (pred_3 ))
:effect (and (pred_4 ?v1)
   (not (pred_6 ?v1 ?v8)) (not (pred_3 ))))


(:action op_3
:parameters (?v8 ?v13 ?v6)
:precondition (and (pred_5 ?v8) (pred_11 ?v13) (pred_11 ?v6)
                  (pred_8 ?v8) (pred_4 ?v6) (pred_6 ?v13 ?v8))
:effect (and (pred_4 ?v13) (pred_6 ?v6 ?v8)
        (not (pred_4 ?v6)) (not (pred_6 ?v13 ?v8))))

(:action op_2
:parameters (?v8 ?v1)
:precondition (and (pred_5 ?v8) (pred_11 ?v1) 
                  (pred_8 ?v8) (pred_4 ?v1))
:effect (and (pred_3 ) (pred_6 ?v1 ?v8) (not (pred_4 ?v1)))))


	
