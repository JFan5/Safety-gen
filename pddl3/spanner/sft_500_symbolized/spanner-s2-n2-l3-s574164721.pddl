; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 574164721 --problem-name spanner-s2-n2-l3-s574164721
(define (problem spanner-s2-n2-l3-s574164721)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_08 obj_09 - type_4
     obj_02 obj_10 - type_1
     obj_04 obj_06 obj_07 - type_2
     obj_05 obj_01 - type_2
    )
 (:init 
    (pred_4 obj_03 obj_05)
    (pred_4 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_4 obj_09 obj_06)
    (pred_5 obj_09)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_01)
    (pred_1 obj_05 obj_04)
    (pred_1 obj_07 obj_01)
    (pred_1 obj_04 obj_06)
    (pred_1 obj_06 obj_07)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
