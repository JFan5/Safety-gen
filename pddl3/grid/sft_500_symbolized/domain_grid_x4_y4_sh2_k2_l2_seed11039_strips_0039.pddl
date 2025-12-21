(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v13)
             (pred_11 ?v10 ?v11)
             (pred_9 ?v3 ?v11)
             (pred_4 ?v6 ?v3 )
	     (pred_3 ?v3)
             (pred_6 ?v5)
             (pred_2 ?v10)
             (pred_7 ?v11)
             (pred_5 ?v3)
             (pred_10 ?v10)
             (pred_1 ?v3)
             (pred_12 ))



(:action op_5
:parameters (?v9 ?v7 ?v1 ?v8)
:precondition (and (pred_6 ?v9) (pred_6 ?v7) (pred_2 ?v1) (pred_7 ?v8)
          (pred_8 ?v9 ?v7) (pred_11 ?v1 ?v8)
                   (pred_9 ?v7 ?v8) (pred_3 ?v9) 
                   (pred_5 ?v7) (pred_10 ?v1))
:effect (and  (pred_1 ?v7) (not (pred_5 ?v7))))


(:action op_2
:parameters (?v9 ?v4)
:precondition (and (pred_6 ?v9) (pred_6 ?v4)
               (pred_3 ?v9) (pred_8 ?v9 ?v4) (pred_1 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v9))))

(:action op_3
:parameters (?v9 ?v1)
:precondition (and (pred_6 ?v9) (pred_2 ?v1) 
                  (pred_3 ?v9) (pred_4 ?v1 ?v9) (pred_12 ))
:effect (and (pred_10 ?v1)
   (not (pred_4 ?v1 ?v9)) (not (pred_12 ))))


(:action op_1
:parameters (?v9 ?v12 ?v2)
:precondition (and (pred_6 ?v9) (pred_2 ?v12) (pred_2 ?v2)
                  (pred_3 ?v9) (pred_10 ?v2) (pred_4 ?v12 ?v9))
:effect (and (pred_10 ?v12) (pred_4 ?v2 ?v9)
        (not (pred_10 ?v2)) (not (pred_4 ?v12 ?v9))))

(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_6 ?v9) (pred_2 ?v1) 
                  (pred_3 ?v9) (pred_10 ?v1))
:effect (and (pred_12 ) (pred_4 ?v1 ?v9) (not (pred_10 ?v1)))))


	
