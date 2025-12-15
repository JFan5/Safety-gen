(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v11)
             (pred_12 ?v13 ?v12)
             (pred_6 ?v9 ?v12)
             (pred_4 ?v6 ?v9 )
	     (pred_9 ?v9)
             (pred_5 ?v3)
             (pred_1 ?v13)
             (pred_8 ?v12)
             (pred_10 ?v9)
             (pred_3 ?v13)
             (pred_7 ?v9)
             (pred_2 ))



(:action op_3
:parameters (?v7 ?v8 ?v1 ?v2)
:precondition (and (pred_5 ?v7) (pred_5 ?v8) (pred_1 ?v1) (pred_8 ?v2)
          (pred_11 ?v7 ?v8) (pred_12 ?v1 ?v2)
                   (pred_6 ?v8 ?v2) (pred_9 ?v7) 
                   (pred_10 ?v8) (pred_3 ?v1))
:effect (and  (pred_7 ?v8) (not (pred_10 ?v8))))


(:action op_1
:parameters (?v7 ?v5)
:precondition (and (pred_5 ?v7) (pred_5 ?v5)
               (pred_9 ?v7) (pred_11 ?v7 ?v5) (pred_7 ?v5))
:effect (and (pred_9 ?v5) (not (pred_9 ?v7))))

(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_5 ?v7) (pred_1 ?v1) 
                  (pred_9 ?v7) (pred_4 ?v1 ?v7) (pred_2 ))
:effect (and (pred_3 ?v1)
   (not (pred_4 ?v1 ?v7)) (not (pred_2 ))))


(:action op_5
:parameters (?v7 ?v4 ?v10)
:precondition (and (pred_5 ?v7) (pred_1 ?v4) (pred_1 ?v10)
                  (pred_9 ?v7) (pred_3 ?v10) (pred_4 ?v4 ?v7))
:effect (and (pred_3 ?v4) (pred_4 ?v10 ?v7)
        (not (pred_3 ?v10)) (not (pred_4 ?v4 ?v7))))

(:action op_4
:parameters (?v7 ?v1)
:precondition (and (pred_5 ?v7) (pred_1 ?v1) 
                  (pred_9 ?v7) (pred_3 ?v1))
:effect (and (pred_2 ) (pred_4 ?v1 ?v7) (not (pred_3 ?v1)))))


	
