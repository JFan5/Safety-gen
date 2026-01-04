; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1734192254 --problem-name spanner-s2-n2-l3-s1734192254
(define (problem spanner-s2-n2-l3-s1734192254)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_05 obj_08 - type_4
     obj_07 obj_06 - type_1
     obj_01 obj_02 obj_03 - type_2
     obj_10 obj_04 - type_2
    )
 (:init 
    (pred_3 obj_09 obj_10)
    (pred_3 obj_05 obj_02)
    (pred_6 obj_05)
    (pred_3 obj_08 obj_02)
    (pred_6 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_04)
    (pred_2 obj_10 obj_01)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_01 obj_02)
    (pred_2 obj_02 obj_03)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
