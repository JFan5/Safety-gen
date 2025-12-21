(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_08 obj_07 - type_2
obj_04 obj_10 obj_06 obj_01 - type_3
obj_03 obj_09 obj_02 - object)
(:init
(pred_1 obj_05 obj_06)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_07)
(pred_2 obj_03 obj_10)
(pred_2 obj_09 obj_04)
(pred_2 obj_02 obj_01)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_09 obj_06)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_07))))
)
)