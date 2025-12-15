; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 683690557 --problem-name spanner-s3-n3-l4-s683690557
(define (problem spanner-s3-n3-l4-s683690557)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_11 obj_05 obj_10 - type_5
     obj_07 obj_04 obj_13 - type_1
     obj_08 obj_02 obj_01 obj_03 - type_3
     obj_12 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_06 obj_12)
    (pred_3 obj_11 obj_08)
    (pred_1 obj_11)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_3 obj_10 obj_01)
    (pred_1 obj_10)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_09)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_4 obj_12 obj_08)
    (pred_4 obj_03 obj_09)
    (pred_4 obj_08 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_03)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_04)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
