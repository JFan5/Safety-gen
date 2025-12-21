(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v1)
             (pred_6 ?v2 ?v9)
             (pred_7 ?v4 ?v9)
             (pred_1 ?v12 ?v4 )
	     (pred_12 ?v4)
             (pred_9 ?v5)
             (pred_5 ?v2)
             (pred_2 ?v9)
             (pred_8 ?v4)
             (pred_11 ?v2)
             (pred_4 ?v4)
             (pred_10 ))



(:action op_4
:parameters (?v6 ?v8 ?v13 ?v3)
:precondition (and (pred_9 ?v6) (pred_9 ?v8) (pred_5 ?v13) (pred_2 ?v3)
          (pred_3 ?v6 ?v8) (pred_6 ?v13 ?v3)
                   (pred_7 ?v8 ?v3) (pred_12 ?v6) 
                   (pred_8 ?v8) (pred_11 ?v13))
:effect (and  (pred_4 ?v8) (not (pred_8 ?v8))))


(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_9 ?v6) (pred_9 ?v11)
               (pred_12 ?v6) (pred_3 ?v6 ?v11) (pred_4 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v6))))

(:action op_3
:parameters (?v6 ?v13)
:precondition (and (pred_9 ?v6) (pred_5 ?v13) 
                  (pred_12 ?v6) (pred_1 ?v13 ?v6) (pred_10 ))
:effect (and (pred_11 ?v13)
   (not (pred_1 ?v13 ?v6)) (not (pred_10 ))))


(:action op_1
:parameters (?v6 ?v7 ?v10)
:precondition (and (pred_9 ?v6) (pred_5 ?v7) (pred_5 ?v10)
                  (pred_12 ?v6) (pred_11 ?v10) (pred_1 ?v7 ?v6))
:effect (and (pred_11 ?v7) (pred_1 ?v10 ?v6)
        (not (pred_11 ?v10)) (not (pred_1 ?v7 ?v6))))

(:action op_2
:parameters (?v6 ?v13)
:precondition (and (pred_9 ?v6) (pred_5 ?v13) 
                  (pred_12 ?v6) (pred_11 ?v13))
:effect (and (pred_10 ) (pred_1 ?v13 ?v6) (not (pred_11 ?v13)))))


	
