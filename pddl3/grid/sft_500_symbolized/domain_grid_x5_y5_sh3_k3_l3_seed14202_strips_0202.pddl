(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v5)
             (pred_1 ?v4 ?v1)
             (pred_5 ?v2 ?v1)
             (pred_4 ?v3 ?v2 )
	     (pred_8 ?v2)
             (pred_9 ?v8)
             (pred_11 ?v4)
             (pred_12 ?v1)
             (pred_2 ?v2)
             (pred_6 ?v4)
             (pred_7 ?v2)
             (pred_10 ))



(:action op_4
:parameters (?v9 ?v6 ?v11 ?v10)
:precondition (and (pred_9 ?v9) (pred_9 ?v6) (pred_11 ?v11) (pred_12 ?v10)
          (pred_3 ?v9 ?v6) (pred_1 ?v11 ?v10)
                   (pred_5 ?v6 ?v10) (pred_8 ?v9) 
                   (pred_2 ?v6) (pred_6 ?v11))
:effect (and  (pred_7 ?v6) (not (pred_2 ?v6))))


(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_9 ?v9) (pred_9 ?v7)
               (pred_8 ?v9) (pred_3 ?v9 ?v7) (pred_7 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v9))))

(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_11 ?v11) 
                  (pred_8 ?v9) (pred_4 ?v11 ?v9) (pred_10 ))
:effect (and (pred_6 ?v11)
   (not (pred_4 ?v11 ?v9)) (not (pred_10 ))))


(:action op_1
:parameters (?v9 ?v12 ?v13)
:precondition (and (pred_9 ?v9) (pred_11 ?v12) (pred_11 ?v13)
                  (pred_8 ?v9) (pred_6 ?v13) (pred_4 ?v12 ?v9))
:effect (and (pred_6 ?v12) (pred_4 ?v13 ?v9)
        (not (pred_6 ?v13)) (not (pred_4 ?v12 ?v9))))

(:action op_5
:parameters (?v9 ?v11)
:precondition (and (pred_9 ?v9) (pred_11 ?v11) 
                  (pred_8 ?v9) (pred_6 ?v11))
:effect (and (pred_10 ) (pred_4 ?v11 ?v9) (not (pred_6 ?v11)))))


	
