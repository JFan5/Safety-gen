(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_07 obj_02 - type_3
obj_04 obj_09 obj_01 obj_03 - type_2
obj_06 obj_10 obj_08 - object)
(:init
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_07)
(pred_4 obj_05 obj_02)
(pred_2 obj_06 obj_03)
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_10 obj_04)
(pred_2 obj_08 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_07))))
)
)