(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v5 ?v4)
             (pred_7 ?v3 ?v8)
             (pred_3 ?v5 ?v8)
             (pred_8 ?v9 ?v5 )
	     (pred_1 ?v5)
             (pred_11 ?v11)
             (pred_10 ?v3)
             (pred_9 ?v8)
             (pred_6 ?v5)
             (pred_5 ?v3)
             (pred_12 ?v5)
             (pred_4 ))



(:action op_5
:parameters (?v13 ?v10 ?v7 ?v12)
:precondition (and (pred_11 ?v13) (pred_11 ?v10) (pred_10 ?v7) (pred_9 ?v12)
          (pred_2 ?v13 ?v10) (pred_7 ?v7 ?v12)
                   (pred_3 ?v10 ?v12) (pred_1 ?v13) 
                   (pred_6 ?v10) (pred_5 ?v7))
:effect (and  (pred_12 ?v10) (not (pred_6 ?v10))))


(:action op_4
:parameters (?v13 ?v1)
:precondition (and (pred_11 ?v13) (pred_11 ?v1)
               (pred_1 ?v13) (pred_2 ?v13 ?v1) (pred_12 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v13))))

(:action op_3
:parameters (?v13 ?v7)
:precondition (and (pred_11 ?v13) (pred_10 ?v7) 
                  (pred_1 ?v13) (pred_8 ?v7 ?v13) (pred_4 ))
:effect (and (pred_5 ?v7)
   (not (pred_8 ?v7 ?v13)) (not (pred_4 ))))


(:action op_2
:parameters (?v13 ?v6 ?v2)
:precondition (and (pred_11 ?v13) (pred_10 ?v6) (pred_10 ?v2)
                  (pred_1 ?v13) (pred_5 ?v2) (pred_8 ?v6 ?v13))
:effect (and (pred_5 ?v6) (pred_8 ?v2 ?v13)
        (not (pred_5 ?v2)) (not (pred_8 ?v6 ?v13))))

(:action op_1
:parameters (?v13 ?v7)
:precondition (and (pred_11 ?v13) (pred_10 ?v7) 
                  (pred_1 ?v13) (pred_5 ?v7))
:effect (and (pred_4 ) (pred_8 ?v7 ?v13) (not (pred_5 ?v7)))))


	
