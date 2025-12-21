(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v8)
             (pred_1 ?v5 ?v2)
             (pred_9 ?v9 ?v2)
             (pred_2 ?v4 ?v9 )
	     (pred_5 ?v9)
             (pred_12 ?v6)
             (pred_7 ?v5)
             (pred_4 ?v2)
             (pred_6 ?v9)
             (pred_8 ?v5)
             (pred_10 ?v9)
             (pred_3 ))



(:action op_2
:parameters (?v3 ?v7 ?v1 ?v12)
:precondition (and (pred_12 ?v3) (pred_12 ?v7) (pred_7 ?v1) (pred_4 ?v12)
          (pred_11 ?v3 ?v7) (pred_1 ?v1 ?v12)
                   (pred_9 ?v7 ?v12) (pred_5 ?v3) 
                   (pred_6 ?v7) (pred_8 ?v1))
:effect (and  (pred_10 ?v7) (not (pred_6 ?v7))))


(:action op_4
:parameters (?v3 ?v13)
:precondition (and (pred_12 ?v3) (pred_12 ?v13)
               (pred_5 ?v3) (pred_11 ?v3 ?v13) (pred_10 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v3))))

(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_12 ?v3) (pred_7 ?v1) 
                  (pred_5 ?v3) (pred_2 ?v1 ?v3) (pred_3 ))
:effect (and (pred_8 ?v1)
   (not (pred_2 ?v1 ?v3)) (not (pred_3 ))))


(:action op_1
:parameters (?v3 ?v10 ?v11)
:precondition (and (pred_12 ?v3) (pred_7 ?v10) (pred_7 ?v11)
                  (pred_5 ?v3) (pred_8 ?v11) (pred_2 ?v10 ?v3))
:effect (and (pred_8 ?v10) (pred_2 ?v11 ?v3)
        (not (pred_8 ?v11)) (not (pred_2 ?v10 ?v3))))

(:action op_5
:parameters (?v3 ?v1)
:precondition (and (pred_12 ?v3) (pred_7 ?v1) 
                  (pred_5 ?v3) (pred_8 ?v1))
:effect (and (pred_3 ) (pred_2 ?v1 ?v3) (not (pred_8 ?v1)))))


	
