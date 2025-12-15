(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v1 ?v2)
             (pred_6 ?v10 ?v4)
             (pred_4 ?v1 ?v4)
             (pred_8 ?v7 ?v1 )
	     (pred_1 ?v1)
             (pred_5 ?v8)
             (pred_2 ?v10)
             (pred_12 ?v4)
             (pred_11 ?v1)
             (pred_7 ?v10)
             (pred_10 ?v1)
             (pred_3 ))



(:action op_4
:parameters (?v13 ?v3 ?v9 ?v6)
:precondition (and (pred_5 ?v13) (pred_5 ?v3) (pred_2 ?v9) (pred_12 ?v6)
          (pred_9 ?v13 ?v3) (pred_6 ?v9 ?v6)
                   (pred_4 ?v3 ?v6) (pred_1 ?v13) 
                   (pred_11 ?v3) (pred_7 ?v9))
:effect (and  (pred_10 ?v3) (not (pred_11 ?v3))))


(:action op_3
:parameters (?v13 ?v5)
:precondition (and (pred_5 ?v13) (pred_5 ?v5)
               (pred_1 ?v13) (pred_9 ?v13 ?v5) (pred_10 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v13))))

(:action op_2
:parameters (?v13 ?v9)
:precondition (and (pred_5 ?v13) (pred_2 ?v9) 
                  (pred_1 ?v13) (pred_8 ?v9 ?v13) (pred_3 ))
:effect (and (pred_7 ?v9)
   (not (pred_8 ?v9 ?v13)) (not (pred_3 ))))


(:action op_1
:parameters (?v13 ?v11 ?v12)
:precondition (and (pred_5 ?v13) (pred_2 ?v11) (pred_2 ?v12)
                  (pred_1 ?v13) (pred_7 ?v12) (pred_8 ?v11 ?v13))
:effect (and (pred_7 ?v11) (pred_8 ?v12 ?v13)
        (not (pred_7 ?v12)) (not (pred_8 ?v11 ?v13))))

(:action op_5
:parameters (?v13 ?v9)
:precondition (and (pred_5 ?v13) (pred_2 ?v9) 
                  (pred_1 ?v13) (pred_7 ?v9))
:effect (and (pred_3 ) (pred_8 ?v9 ?v13) (not (pred_7 ?v9)))))


	
