(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v5)
             (pred_4 ?v12 ?v4)
             (pred_7 ?v8 ?v4)
             (pred_5 ?v7 ?v8 )
	     (pred_2 ?v8)
             (pred_1 ?v3)
             (pred_3 ?v12)
             (pred_10 ?v4)
             (pred_12 ?v8)
             (pred_8 ?v12)
             (pred_11 ?v8)
             (pred_9 ))



(:action op_3
:parameters (?v13 ?v10 ?v6 ?v11)
:precondition (and (pred_1 ?v13) (pred_1 ?v10) (pred_3 ?v6) (pred_10 ?v11)
          (pred_6 ?v13 ?v10) (pred_4 ?v6 ?v11)
                   (pred_7 ?v10 ?v11) (pred_2 ?v13) 
                   (pred_12 ?v10) (pred_8 ?v6))
:effect (and  (pred_11 ?v10) (not (pred_12 ?v10))))


(:action op_5
:parameters (?v13 ?v9)
:precondition (and (pred_1 ?v13) (pred_1 ?v9)
               (pred_2 ?v13) (pred_6 ?v13 ?v9) (pred_11 ?v9))
:effect (and (pred_2 ?v9) (not (pred_2 ?v13))))

(:action op_1
:parameters (?v13 ?v6)
:precondition (and (pred_1 ?v13) (pred_3 ?v6) 
                  (pred_2 ?v13) (pred_5 ?v6 ?v13) (pred_9 ))
:effect (and (pred_8 ?v6)
   (not (pred_5 ?v6 ?v13)) (not (pred_9 ))))


(:action op_4
:parameters (?v13 ?v1 ?v2)
:precondition (and (pred_1 ?v13) (pred_3 ?v1) (pred_3 ?v2)
                  (pred_2 ?v13) (pred_8 ?v2) (pred_5 ?v1 ?v13))
:effect (and (pred_8 ?v1) (pred_5 ?v2 ?v13)
        (not (pred_8 ?v2)) (not (pred_5 ?v1 ?v13))))

(:action op_2
:parameters (?v13 ?v6)
:precondition (and (pred_1 ?v13) (pred_3 ?v6) 
                  (pred_2 ?v13) (pred_8 ?v6))
:effect (and (pred_9 ) (pred_5 ?v6 ?v13) (not (pred_8 ?v6)))))


	
