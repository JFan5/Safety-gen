; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1857065126 --problem-name spanner-s2-n2-l3-s1857065126
(define (problem spanner-s2-n2-l3-s1857065126)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_07 obj_05 - type_4
     obj_04 obj_08 - type_1
     obj_02 obj_03 obj_09 - type_5
     obj_10 obj_01 - type_5
    )
 (:init 
    (pred_2 obj_06 obj_10)
    (pred_2 obj_07 obj_02)
    (pred_3 obj_07)
    (pred_2 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_01)
    (pred_4 obj_08)
    (pred_2 obj_08 obj_01)
    (pred_6 obj_10 obj_02)
    (pred_6 obj_09 obj_01)
    (pred_6 obj_02 obj_03)
    (pred_6 obj_03 obj_09)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
