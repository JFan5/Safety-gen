; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1857065126 --problem-name spanner-s2-n2-l3-s1857065126
(define (problem spanner-s2-n2-l3-s1857065126)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_04 obj_03 - type_2
     obj_02 obj_09 - type_5
     obj_10 obj_07 obj_06 - type_1
     obj_08 obj_05 - type_1
    )
 (:init 
    (pred_6 obj_01 obj_08)
    (pred_6 obj_04 obj_10)
    (pred_3 obj_04)
    (pred_6 obj_03 obj_06)
    (pred_3 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_05)
    (pred_1 obj_08 obj_10)
    (pred_1 obj_06 obj_05)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_06)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
