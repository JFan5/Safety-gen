(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v2 ?v12)
             (pred_2 ?v3 ?v6)
             (pred_11 ?v2 ?v6)
             (pred_6 ?v5 ?v2 )
	     (pred_7 ?v2)
             (pred_12 ?v9)
             (pred_5 ?v3)
             (pred_3 ?v6)
             (pred_10 ?v2)
             (pred_9 ?v3)
             (pred_4 ?v2)
             (pred_8 ))



(:action op_4
:parameters (?v13 ?v8 ?v7 ?v4)
:precondition (and (pred_12 ?v13) (pred_12 ?v8) (pred_5 ?v7) (pred_3 ?v4)
          (pred_1 ?v13 ?v8) (pred_2 ?v7 ?v4)
                   (pred_11 ?v8 ?v4) (pred_7 ?v13) 
                   (pred_10 ?v8) (pred_9 ?v7))
:effect (and  (pred_4 ?v8) (not (pred_10 ?v8))))


(:action op_2
:parameters (?v13 ?v10)
:precondition (and (pred_12 ?v13) (pred_12 ?v10)
               (pred_7 ?v13) (pred_1 ?v13 ?v10) (pred_4 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v13))))

(:action op_5
:parameters (?v13 ?v7)
:precondition (and (pred_12 ?v13) (pred_5 ?v7) 
                  (pred_7 ?v13) (pred_6 ?v7 ?v13) (pred_8 ))
:effect (and (pred_9 ?v7)
   (not (pred_6 ?v7 ?v13)) (not (pred_8 ))))


(:action op_1
:parameters (?v13 ?v11 ?v1)
:precondition (and (pred_12 ?v13) (pred_5 ?v11) (pred_5 ?v1)
                  (pred_7 ?v13) (pred_9 ?v1) (pred_6 ?v11 ?v13))
:effect (and (pred_9 ?v11) (pred_6 ?v1 ?v13)
        (not (pred_9 ?v1)) (not (pred_6 ?v11 ?v13))))

(:action op_3
:parameters (?v13 ?v7)
:precondition (and (pred_12 ?v13) (pred_5 ?v7) 
                  (pred_7 ?v13) (pred_9 ?v7))
:effect (and (pred_8 ) (pred_6 ?v7 ?v13) (not (pred_9 ?v7)))))


	
