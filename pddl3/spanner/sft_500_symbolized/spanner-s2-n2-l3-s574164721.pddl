; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 574164721 --problem-name spanner-s2-n2-l3-s574164721
(define (problem spanner-s2-n2-l3-s574164721)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_01 obj_10 - type_5
     obj_06 obj_02 - type_3
     obj_05 obj_08 obj_04 - type_1
     obj_09 obj_03 - type_1
    )
 (:init 
    (pred_1 obj_07 obj_09)
    (pred_1 obj_01 obj_05)
    (pred_3 obj_01)
    (pred_1 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_03)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_03)
    (pred_5 obj_09 obj_05)
    (pred_5 obj_04 obj_03)
    (pred_5 obj_05 obj_08)
    (pred_5 obj_08 obj_04)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
