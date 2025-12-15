(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_08 obj_06 - type_2
obj_05 obj_07 obj_02 - type_1
obj_03 obj_04 obj_09 - object)
(:init
(pred_3 obj_01 obj_05)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_06)
(pred_1 obj_03 obj_07)
(pred_1 obj_04 obj_05)
(pred_1 obj_09 obj_07)
)
(:goal
(and
(pred_1 obj_03 obj_07)
(pred_1 obj_04 obj_02)
(pred_1 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_06))))
)
)