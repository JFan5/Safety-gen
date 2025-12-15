(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v10)
             (pred_8 ?v1 ?v7)
             (pred_7 ?v8 ?v7)
             (pred_6 ?v3 ?v8 )
	     (pred_10 ?v8)
             (pred_1 ?v6)
             (pred_9 ?v1)
             (pred_12 ?v7)
             (pred_2 ?v8)
             (pred_3 ?v1)
             (pred_4 ?v8)
             (pred_5 ))



(:action op_1
:parameters (?v9 ?v13 ?v2 ?v11)
:precondition (and (pred_1 ?v9) (pred_1 ?v13) (pred_9 ?v2) (pred_12 ?v11)
          (pred_11 ?v9 ?v13) (pred_8 ?v2 ?v11)
                   (pred_7 ?v13 ?v11) (pred_10 ?v9) 
                   (pred_2 ?v13) (pred_3 ?v2))
:effect (and  (pred_4 ?v13) (not (pred_2 ?v13))))


(:action op_5
:parameters (?v9 ?v4)
:precondition (and (pred_1 ?v9) (pred_1 ?v4)
               (pred_10 ?v9) (pred_11 ?v9 ?v4) (pred_4 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v9))))

(:action op_2
:parameters (?v9 ?v2)
:precondition (and (pred_1 ?v9) (pred_9 ?v2) 
                  (pred_10 ?v9) (pred_6 ?v2 ?v9) (pred_5 ))
:effect (and (pred_3 ?v2)
   (not (pred_6 ?v2 ?v9)) (not (pred_5 ))))


(:action op_4
:parameters (?v9 ?v12 ?v5)
:precondition (and (pred_1 ?v9) (pred_9 ?v12) (pred_9 ?v5)
                  (pred_10 ?v9) (pred_3 ?v5) (pred_6 ?v12 ?v9))
:effect (and (pred_3 ?v12) (pred_6 ?v5 ?v9)
        (not (pred_3 ?v5)) (not (pred_6 ?v12 ?v9))))

(:action op_3
:parameters (?v9 ?v2)
:precondition (and (pred_1 ?v9) (pred_9 ?v2) 
                  (pred_10 ?v9) (pred_3 ?v2))
:effect (and (pred_5 ) (pred_6 ?v2 ?v9) (not (pred_3 ?v2)))))


	
