(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_06 obj_02 - type_2
obj_08 obj_01 obj_05 - type_1
obj_03 obj_09 obj_04 - object)
(:init
(pred_3 obj_07 obj_01)
(pred_1 obj_07 obj_06)
(pred_1 obj_07 obj_02)
(pred_4 obj_03 obj_05)
(pred_4 obj_09 obj_01)
(pred_4 obj_04 obj_05)
)
(:goal
(and
(pred_4 obj_03 obj_01)
(pred_4 obj_09 obj_01)
(pred_4 obj_04 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_07 ?b obj_06))))
)
)