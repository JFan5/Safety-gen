(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v6)
             (pred_12 ?v11 ?v1)
             (pred_2 ?v7 ?v1)
             (pred_8 ?v8 ?v7 )
	     (pred_4 ?v7)
             (pred_1 ?v5)
             (pred_3 ?v11)
             (pred_6 ?v1)
             (pred_10 ?v7)
             (pred_7 ?v11)
             (pred_11 ?v7)
             (pred_9 ))



(:action op_2
:parameters (?v9 ?v13 ?v3 ?v10)
:precondition (and (pred_1 ?v9) (pred_1 ?v13) (pred_3 ?v3) (pred_6 ?v10)
          (pred_5 ?v9 ?v13) (pred_12 ?v3 ?v10)
                   (pred_2 ?v13 ?v10) (pred_4 ?v9) 
                   (pred_10 ?v13) (pred_7 ?v3))
:effect (and  (pred_11 ?v13) (not (pred_10 ?v13))))


(:action op_1
:parameters (?v9 ?v12)
:precondition (and (pred_1 ?v9) (pred_1 ?v12)
               (pred_4 ?v9) (pred_5 ?v9 ?v12) (pred_11 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v9))))

(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_1 ?v9) (pred_3 ?v3) 
                  (pred_4 ?v9) (pred_8 ?v3 ?v9) (pred_9 ))
:effect (and (pred_7 ?v3)
   (not (pred_8 ?v3 ?v9)) (not (pred_9 ))))


(:action op_3
:parameters (?v9 ?v2 ?v4)
:precondition (and (pred_1 ?v9) (pred_3 ?v2) (pred_3 ?v4)
                  (pred_4 ?v9) (pred_7 ?v4) (pred_8 ?v2 ?v9))
:effect (and (pred_7 ?v2) (pred_8 ?v4 ?v9)
        (not (pred_7 ?v4)) (not (pred_8 ?v2 ?v9))))

(:action op_5
:parameters (?v9 ?v3)
:precondition (and (pred_1 ?v9) (pred_3 ?v3) 
                  (pred_4 ?v9) (pred_7 ?v3))
:effect (and (pred_9 ) (pred_8 ?v3 ?v9) (not (pred_7 ?v3)))))


	
