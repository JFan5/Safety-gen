(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_04 obj_07 - type_1
obj_01 obj_06 obj_09 obj_05 - type_3
obj_03 obj_10 obj_08 - object)
(:init
(pred_4 obj_02 obj_09)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_07)
(pred_2 obj_03 obj_06)
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_09)
)
(:goal
(and
(pred_2 obj_03 obj_05)
(pred_2 obj_10 obj_01)
(pred_2 obj_08 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_07))))
)
)