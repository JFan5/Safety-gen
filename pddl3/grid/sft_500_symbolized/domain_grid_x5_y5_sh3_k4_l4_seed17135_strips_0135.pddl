(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v3 ?v9)
             (pred_4 ?v6 ?v12)
             (pred_5 ?v3 ?v12)
             (pred_1 ?v10 ?v3 )
	     (pred_12 ?v3)
             (pred_11 ?v11)
             (pred_2 ?v6)
             (pred_7 ?v12)
             (pred_3 ?v3)
             (pred_9 ?v6)
             (pred_10 ?v3)
             (pred_8 ))



(:action op_3
:parameters (?v13 ?v8 ?v2 ?v1)
:precondition (and (pred_11 ?v13) (pred_11 ?v8) (pred_2 ?v2) (pred_7 ?v1)
          (pred_6 ?v13 ?v8) (pred_4 ?v2 ?v1)
                   (pred_5 ?v8 ?v1) (pred_12 ?v13) 
                   (pred_3 ?v8) (pred_9 ?v2))
:effect (and  (pred_10 ?v8) (not (pred_3 ?v8))))


(:action op_5
:parameters (?v13 ?v7)
:precondition (and (pred_11 ?v13) (pred_11 ?v7)
               (pred_12 ?v13) (pred_6 ?v13 ?v7) (pred_10 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v13))))

(:action op_1
:parameters (?v13 ?v2)
:precondition (and (pred_11 ?v13) (pred_2 ?v2) 
                  (pred_12 ?v13) (pred_1 ?v2 ?v13) (pred_8 ))
:effect (and (pred_9 ?v2)
   (not (pred_1 ?v2 ?v13)) (not (pred_8 ))))


(:action op_2
:parameters (?v13 ?v4 ?v5)
:precondition (and (pred_11 ?v13) (pred_2 ?v4) (pred_2 ?v5)
                  (pred_12 ?v13) (pred_9 ?v5) (pred_1 ?v4 ?v13))
:effect (and (pred_9 ?v4) (pred_1 ?v5 ?v13)
        (not (pred_9 ?v5)) (not (pred_1 ?v4 ?v13))))

(:action op_4
:parameters (?v13 ?v2)
:precondition (and (pred_11 ?v13) (pred_2 ?v2) 
                  (pred_12 ?v13) (pred_9 ?v2))
:effect (and (pred_8 ) (pred_1 ?v2 ?v13) (not (pred_9 ?v2)))))


	
