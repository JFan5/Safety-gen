(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v5)
             (pred_8 ?v1 ?v2)
             (pred_1 ?v11 ?v2)
             (pred_10 ?v7 ?v11 )
	     (pred_3 ?v11)
             (pred_5 ?v6)
             (pred_6 ?v1)
             (pred_11 ?v2)
             (pred_2 ?v11)
             (pred_9 ?v1)
             (pred_12 ?v11)
             (pred_4 ))



(:action op_3
:parameters (?v13 ?v3 ?v9 ?v10)
:precondition (and (pred_5 ?v13) (pred_5 ?v3) (pred_6 ?v9) (pred_11 ?v10)
          (pred_7 ?v13 ?v3) (pred_8 ?v9 ?v10)
                   (pred_1 ?v3 ?v10) (pred_3 ?v13) 
                   (pred_2 ?v3) (pred_9 ?v9))
:effect (and  (pred_12 ?v3) (not (pred_2 ?v3))))


(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_5 ?v13) (pred_5 ?v4)
               (pred_3 ?v13) (pred_7 ?v13 ?v4) (pred_12 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v13))))

(:action op_2
:parameters (?v13 ?v9)
:precondition (and (pred_5 ?v13) (pred_6 ?v9) 
                  (pred_3 ?v13) (pred_10 ?v9 ?v13) (pred_4 ))
:effect (and (pred_9 ?v9)
   (not (pred_10 ?v9 ?v13)) (not (pred_4 ))))


(:action op_4
:parameters (?v13 ?v12 ?v8)
:precondition (and (pred_5 ?v13) (pred_6 ?v12) (pred_6 ?v8)
                  (pred_3 ?v13) (pred_9 ?v8) (pred_10 ?v12 ?v13))
:effect (and (pred_9 ?v12) (pred_10 ?v8 ?v13)
        (not (pred_9 ?v8)) (not (pred_10 ?v12 ?v13))))

(:action op_1
:parameters (?v13 ?v9)
:precondition (and (pred_5 ?v13) (pred_6 ?v9) 
                  (pred_3 ?v13) (pred_9 ?v9))
:effect (and (pred_4 ) (pred_10 ?v9 ?v13) (not (pred_9 ?v9)))))


	
