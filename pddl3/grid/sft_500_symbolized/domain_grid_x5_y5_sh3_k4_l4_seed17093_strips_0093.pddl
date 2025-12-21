(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v7)
             (pred_1 ?v12 ?v6)
             (pred_11 ?v5 ?v6)
             (pred_6 ?v8 ?v5 )
	     (pred_2 ?v5)
             (pred_12 ?v9)
             (pred_4 ?v12)
             (pred_5 ?v6)
             (pred_7 ?v5)
             (pred_3 ?v12)
             (pred_8 ?v5)
             (pred_10 ))



(:action op_2
:parameters (?v13 ?v10 ?v1 ?v11)
:precondition (and (pred_12 ?v13) (pred_12 ?v10) (pred_4 ?v1) (pred_5 ?v11)
          (pred_9 ?v13 ?v10) (pred_1 ?v1 ?v11)
                   (pred_11 ?v10 ?v11) (pred_2 ?v13) 
                   (pred_7 ?v10) (pred_3 ?v1))
:effect (and  (pred_8 ?v10) (not (pred_7 ?v10))))


(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_12 ?v13) (pred_12 ?v3)
               (pred_2 ?v13) (pred_9 ?v13 ?v3) (pred_8 ?v3))
:effect (and (pred_2 ?v3) (not (pred_2 ?v13))))

(:action op_3
:parameters (?v13 ?v1)
:precondition (and (pred_12 ?v13) (pred_4 ?v1) 
                  (pred_2 ?v13) (pred_6 ?v1 ?v13) (pred_10 ))
:effect (and (pred_3 ?v1)
   (not (pred_6 ?v1 ?v13)) (not (pred_10 ))))


(:action op_4
:parameters (?v13 ?v4 ?v2)
:precondition (and (pred_12 ?v13) (pred_4 ?v4) (pred_4 ?v2)
                  (pred_2 ?v13) (pred_3 ?v2) (pred_6 ?v4 ?v13))
:effect (and (pred_3 ?v4) (pred_6 ?v2 ?v13)
        (not (pred_3 ?v2)) (not (pred_6 ?v4 ?v13))))

(:action op_1
:parameters (?v13 ?v1)
:precondition (and (pred_12 ?v13) (pred_4 ?v1) 
                  (pred_2 ?v13) (pred_3 ?v1))
:effect (and (pred_10 ) (pred_6 ?v1 ?v13) (not (pred_3 ?v1)))))


	
