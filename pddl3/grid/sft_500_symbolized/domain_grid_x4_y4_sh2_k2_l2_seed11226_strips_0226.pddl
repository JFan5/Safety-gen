(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v3 ?v4)
             (pred_7 ?v6 ?v1)
             (pred_11 ?v3 ?v1)
             (pred_3 ?v11 ?v3 )
	     (pred_2 ?v3)
             (pred_12 ?v10)
             (pred_10 ?v6)
             (pred_6 ?v1)
             (pred_5 ?v3)
             (pred_1 ?v6)
             (pred_8 ?v3)
             (pred_9 ))



(:action op_3
:parameters (?v7 ?v9 ?v8 ?v12)
:precondition (and (pred_12 ?v7) (pred_12 ?v9) (pred_10 ?v8) (pred_6 ?v12)
          (pred_4 ?v7 ?v9) (pred_7 ?v8 ?v12)
                   (pred_11 ?v9 ?v12) (pred_2 ?v7) 
                   (pred_5 ?v9) (pred_1 ?v8))
:effect (and  (pred_8 ?v9) (not (pred_5 ?v9))))


(:action op_5
:parameters (?v7 ?v5)
:precondition (and (pred_12 ?v7) (pred_12 ?v5)
               (pred_2 ?v7) (pred_4 ?v7 ?v5) (pred_8 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v7))))

(:action op_1
:parameters (?v7 ?v8)
:precondition (and (pred_12 ?v7) (pred_10 ?v8) 
                  (pred_2 ?v7) (pred_3 ?v8 ?v7) (pred_9 ))
:effect (and (pred_1 ?v8)
   (not (pred_3 ?v8 ?v7)) (not (pred_9 ))))


(:action op_2
:parameters (?v7 ?v2 ?v13)
:precondition (and (pred_12 ?v7) (pred_10 ?v2) (pred_10 ?v13)
                  (pred_2 ?v7) (pred_1 ?v13) (pred_3 ?v2 ?v7))
:effect (and (pred_1 ?v2) (pred_3 ?v13 ?v7)
        (not (pred_1 ?v13)) (not (pred_3 ?v2 ?v7))))

(:action op_4
:parameters (?v7 ?v8)
:precondition (and (pred_12 ?v7) (pred_10 ?v8) 
                  (pred_2 ?v7) (pred_1 ?v8))
:effect (and (pred_9 ) (pred_3 ?v8 ?v7) (not (pred_1 ?v8)))))


	
