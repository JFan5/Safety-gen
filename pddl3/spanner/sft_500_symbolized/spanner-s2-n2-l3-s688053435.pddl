; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 688053435 --problem-name spanner-s2-n2-l3-s688053435
(define (problem spanner-s2-n2-l3-s688053435)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_02 obj_03 - type_3
     obj_06 obj_01 - type_1
     obj_08 obj_04 obj_10 - type_5
     obj_07 obj_09 - type_5
    )
 (:init 
    (pred_1 obj_05 obj_07)
    (pred_1 obj_02 obj_08)
    (pred_4 obj_02)
    (pred_1 obj_03 obj_04)
    (pred_4 obj_03)
    (pred_2 obj_06)
    (pred_1 obj_06 obj_09)
    (pred_2 obj_01)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_07 obj_08)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_10)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
