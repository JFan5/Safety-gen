; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 574164721 --problem-name spanner-s2-n2-l3-s574164721
(define (problem spanner-s2-n2-l3-s574164721)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_06 obj_07 - type_5
     obj_05 obj_09 - type_4
     obj_02 obj_01 obj_03 - type_2
     obj_04 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_10 obj_04)
    (pred_2 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_08)
    (pred_6 obj_04 obj_02)
    (pred_6 obj_03 obj_08)
    (pred_6 obj_02 obj_01)
    (pred_6 obj_01 obj_03)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
