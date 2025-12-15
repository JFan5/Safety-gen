; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1067637600 --problem-name spanner-s2-n2-l3-s1067637600
(define (problem spanner-s2-n2-l3-s1067637600)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_08 obj_07 - type_4
     obj_04 obj_02 - type_1
     obj_09 obj_01 obj_05 - type_5
     obj_03 obj_10 - type_5
    )
 (:init 
    (pred_1 obj_06 obj_03)
    (pred_1 obj_08 obj_01)
    (pred_2 obj_08)
    (pred_1 obj_07 obj_01)
    (pred_2 obj_07)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_10)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_10)
    (pred_3 obj_03 obj_09)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_09 obj_01)
    (pred_3 obj_01 obj_05)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
