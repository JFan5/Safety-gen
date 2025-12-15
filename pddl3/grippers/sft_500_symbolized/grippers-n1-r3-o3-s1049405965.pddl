(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_07 obj_01 - type_2
obj_08 obj_06 obj_04 - type_1
obj_09 obj_05 obj_02 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_01)
(pred_2 obj_09 obj_06)
(pred_2 obj_05 obj_06)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_05 obj_08)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_07))))
)
)