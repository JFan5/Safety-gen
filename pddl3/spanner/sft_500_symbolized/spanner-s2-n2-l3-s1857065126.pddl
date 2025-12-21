; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1857065126 --problem-name spanner-s2-n2-l3-s1857065126
(define (problem spanner-s2-n2-l3-s1857065126)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_05 obj_09 - type_5
     obj_01 obj_03 - type_4
     obj_07 obj_10 obj_08 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_02)
    (pred_2 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_2 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_04)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_10 obj_08)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
