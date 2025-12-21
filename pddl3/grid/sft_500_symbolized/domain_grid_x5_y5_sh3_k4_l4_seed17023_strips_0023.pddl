(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v1)
             (pred_4 ?v10 ?v3)
             (pred_5 ?v5 ?v3)
             (pred_1 ?v8 ?v5 )
	     (pred_11 ?v5)
             (pred_3 ?v6)
             (pred_10 ?v10)
             (pred_2 ?v3)
             (pred_12 ?v5)
             (pred_9 ?v10)
             (pred_8 ?v5)
             (pred_7 ))



(:action op_4
:parameters (?v13 ?v2 ?v11 ?v12)
:precondition (and (pred_3 ?v13) (pred_3 ?v2) (pred_10 ?v11) (pred_2 ?v12)
          (pred_6 ?v13 ?v2) (pred_4 ?v11 ?v12)
                   (pred_5 ?v2 ?v12) (pred_11 ?v13) 
                   (pred_12 ?v2) (pred_9 ?v11))
:effect (and  (pred_8 ?v2) (not (pred_12 ?v2))))


(:action op_3
:parameters (?v13 ?v9)
:precondition (and (pred_3 ?v13) (pred_3 ?v9)
               (pred_11 ?v13) (pred_6 ?v13 ?v9) (pred_8 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v13))))

(:action op_2
:parameters (?v13 ?v11)
:precondition (and (pred_3 ?v13) (pred_10 ?v11) 
                  (pred_11 ?v13) (pred_1 ?v11 ?v13) (pred_7 ))
:effect (and (pred_9 ?v11)
   (not (pred_1 ?v11 ?v13)) (not (pred_7 ))))


(:action op_5
:parameters (?v13 ?v7 ?v4)
:precondition (and (pred_3 ?v13) (pred_10 ?v7) (pred_10 ?v4)
                  (pred_11 ?v13) (pred_9 ?v4) (pred_1 ?v7 ?v13))
:effect (and (pred_9 ?v7) (pred_1 ?v4 ?v13)
        (not (pred_9 ?v4)) (not (pred_1 ?v7 ?v13))))

(:action op_1
:parameters (?v13 ?v11)
:precondition (and (pred_3 ?v13) (pred_10 ?v11) 
                  (pred_11 ?v13) (pred_9 ?v11))
:effect (and (pred_7 ) (pred_1 ?v11 ?v13) (not (pred_9 ?v11)))))


	
