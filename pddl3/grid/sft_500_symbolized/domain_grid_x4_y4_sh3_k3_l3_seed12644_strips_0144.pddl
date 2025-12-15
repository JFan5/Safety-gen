(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v8)
             (pred_5 ?v4 ?v5)
             (pred_10 ?v6 ?v5)
             (pred_3 ?v1 ?v6 )
	     (pred_1 ?v6)
             (pred_12 ?v10)
             (pred_6 ?v4)
             (pred_8 ?v5)
             (pred_9 ?v6)
             (pred_7 ?v4)
             (pred_2 ?v6)
             (pred_11 ))



(:action op_3
:parameters (?v9 ?v7 ?v12 ?v13)
:precondition (and (pred_12 ?v9) (pred_12 ?v7) (pred_6 ?v12) (pred_8 ?v13)
          (pred_4 ?v9 ?v7) (pred_5 ?v12 ?v13)
                   (pred_10 ?v7 ?v13) (pred_1 ?v9) 
                   (pred_9 ?v7) (pred_7 ?v12))
:effect (and  (pred_2 ?v7) (not (pred_9 ?v7))))


(:action op_5
:parameters (?v9 ?v11)
:precondition (and (pred_12 ?v9) (pred_12 ?v11)
               (pred_1 ?v9) (pred_4 ?v9 ?v11) (pred_2 ?v11))
:effect (and (pred_1 ?v11) (not (pred_1 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_12 ?v9) (pred_6 ?v12) 
                  (pred_1 ?v9) (pred_3 ?v12 ?v9) (pred_11 ))
:effect (and (pred_7 ?v12)
   (not (pred_3 ?v12 ?v9)) (not (pred_11 ))))


(:action op_1
:parameters (?v9 ?v2 ?v3)
:precondition (and (pred_12 ?v9) (pred_6 ?v2) (pred_6 ?v3)
                  (pred_1 ?v9) (pred_7 ?v3) (pred_3 ?v2 ?v9))
:effect (and (pred_7 ?v2) (pred_3 ?v3 ?v9)
        (not (pred_7 ?v3)) (not (pred_3 ?v2 ?v9))))

(:action op_2
:parameters (?v9 ?v12)
:precondition (and (pred_12 ?v9) (pred_6 ?v12) 
                  (pred_1 ?v9) (pred_7 ?v12))
:effect (and (pred_11 ) (pred_3 ?v12 ?v9) (not (pred_7 ?v12)))))


	
