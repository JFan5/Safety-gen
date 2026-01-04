(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_02 obj_05 - type_3
obj_09 obj_08 obj_01 obj_04 - type_2
obj_10 obj_06 obj_03 - object)
(:init
(pred_2 obj_07 obj_01)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_05)
(pred_3 obj_10 obj_01)
(pred_3 obj_06 obj_01)
(pred_3 obj_03 obj_08)
)
(:goal
(and
(pred_3 obj_10 obj_09)
(pred_3 obj_06 obj_01)
(pred_3 obj_03 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_02))))
)
)