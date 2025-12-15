(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v12 ?v3)
             (pred_7 ?v8 ?v13)
             (pred_12 ?v12 ?v13)
             (pred_11 ?v2 ?v12 )
	     (pred_1 ?v12)
             (pred_9 ?v5)
             (pred_4 ?v8)
             (pred_2 ?v13)
             (pred_3 ?v12)
             (pred_10 ?v8)
             (pred_8 ?v12)
             (pred_6 ))



(:action op_5
:parameters (?v7 ?v9 ?v6 ?v11)
:precondition (and (pred_9 ?v7) (pred_9 ?v9) (pred_4 ?v6) (pred_2 ?v11)
          (pred_5 ?v7 ?v9) (pred_7 ?v6 ?v11)
                   (pred_12 ?v9 ?v11) (pred_1 ?v7) 
                   (pred_3 ?v9) (pred_10 ?v6))
:effect (and  (pred_8 ?v9) (not (pred_3 ?v9))))


(:action op_3
:parameters (?v7 ?v1)
:precondition (and (pred_9 ?v7) (pred_9 ?v1)
               (pred_1 ?v7) (pred_5 ?v7 ?v1) (pred_8 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v7))))

(:action op_4
:parameters (?v7 ?v6)
:precondition (and (pred_9 ?v7) (pred_4 ?v6) 
                  (pred_1 ?v7) (pred_11 ?v6 ?v7) (pred_6 ))
:effect (and (pred_10 ?v6)
   (not (pred_11 ?v6 ?v7)) (not (pred_6 ))))


(:action op_1
:parameters (?v7 ?v10 ?v4)
:precondition (and (pred_9 ?v7) (pred_4 ?v10) (pred_4 ?v4)
                  (pred_1 ?v7) (pred_10 ?v4) (pred_11 ?v10 ?v7))
:effect (and (pred_10 ?v10) (pred_11 ?v4 ?v7)
        (not (pred_10 ?v4)) (not (pred_11 ?v10 ?v7))))

(:action op_2
:parameters (?v7 ?v6)
:precondition (and (pred_9 ?v7) (pred_4 ?v6) 
                  (pred_1 ?v7) (pred_10 ?v6))
:effect (and (pred_6 ) (pred_11 ?v6 ?v7) (not (pred_10 ?v6)))))


	
