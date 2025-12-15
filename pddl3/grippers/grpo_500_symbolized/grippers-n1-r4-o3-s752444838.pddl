(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_02 obj_06 - type_3
obj_08 obj_10 obj_05 obj_03 - type_2
obj_07 obj_04 obj_09 - object)
(:init
(pred_3 obj_01 obj_10)
(pred_4 obj_01 obj_02)
(pred_4 obj_01 obj_06)
(pred_2 obj_07 obj_10)
(pred_2 obj_04 obj_10)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_07 obj_10)
(pred_2 obj_04 obj_05)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_01 ?b obj_06))))
)
)