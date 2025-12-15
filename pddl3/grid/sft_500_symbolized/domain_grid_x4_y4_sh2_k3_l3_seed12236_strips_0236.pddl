(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v9)
             (pred_7 ?v6 ?v7)
             (pred_1 ?v1 ?v7)
             (pred_3 ?v5 ?v1 )
	     (pred_2 ?v1)
             (pred_4 ?v3)
             (pred_11 ?v6)
             (pred_10 ?v7)
             (pred_9 ?v1)
             (pred_8 ?v6)
             (pred_6 ?v1)
             (pred_5 ))



(:action op_3
:parameters (?v13 ?v10 ?v12 ?v4)
:precondition (and (pred_4 ?v13) (pred_4 ?v10) (pred_11 ?v12) (pred_10 ?v4)
          (pred_12 ?v13 ?v10) (pred_7 ?v12 ?v4)
                   (pred_1 ?v10 ?v4) (pred_2 ?v13) 
                   (pred_9 ?v10) (pred_8 ?v12))
:effect (and  (pred_6 ?v10) (not (pred_9 ?v10))))


(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_4 ?v13) (pred_4 ?v8)
               (pred_2 ?v13) (pred_12 ?v13 ?v8) (pred_6 ?v8))
:effect (and (pred_2 ?v8) (not (pred_2 ?v13))))

(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_4 ?v13) (pred_11 ?v12) 
                  (pred_2 ?v13) (pred_3 ?v12 ?v13) (pred_5 ))
:effect (and (pred_8 ?v12)
   (not (pred_3 ?v12 ?v13)) (not (pred_5 ))))


(:action op_2
:parameters (?v13 ?v11 ?v2)
:precondition (and (pred_4 ?v13) (pred_11 ?v11) (pred_11 ?v2)
                  (pred_2 ?v13) (pred_8 ?v2) (pred_3 ?v11 ?v13))
:effect (and (pred_8 ?v11) (pred_3 ?v2 ?v13)
        (not (pred_8 ?v2)) (not (pred_3 ?v11 ?v13))))

(:action op_5
:parameters (?v13 ?v12)
:precondition (and (pred_4 ?v13) (pred_11 ?v12) 
                  (pred_2 ?v13) (pred_8 ?v12))
:effect (and (pred_5 ) (pred_3 ?v12 ?v13) (not (pred_8 ?v12)))))


	
