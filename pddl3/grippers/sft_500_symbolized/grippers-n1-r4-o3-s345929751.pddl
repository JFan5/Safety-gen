(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_04 obj_07 - type_2
obj_03 obj_05 obj_02 obj_01 - type_3
obj_08 obj_10 obj_09 - object)
(:init
(pred_1 obj_06 obj_01)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_07)
(pred_2 obj_08 obj_03)
(pred_2 obj_10 obj_03)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_03)
(pred_2 obj_10 obj_01)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_07))))
)
)