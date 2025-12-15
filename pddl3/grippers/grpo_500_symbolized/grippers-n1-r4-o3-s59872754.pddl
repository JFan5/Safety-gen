(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_08 obj_07 - type_3
obj_09 obj_06 obj_03 obj_01 - type_2
obj_05 obj_04 obj_02 - object)
(:init
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_07)
(pred_2 obj_05 obj_03)
(pred_2 obj_04 obj_01)
(pred_2 obj_02 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_09)
(pred_2 obj_02 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_07))))
)
)