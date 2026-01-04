(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_08 obj_05 - type_2
obj_01 obj_06 obj_10 obj_09 - type_3
obj_04 obj_03 obj_02 - object)
(:init
(pred_3 obj_07 obj_06)
(pred_2 obj_07 obj_08)
(pred_2 obj_07 obj_05)
(pred_1 obj_04 obj_09)
(pred_1 obj_03 obj_10)
(pred_1 obj_02 obj_06)
)
(:goal
(and
(pred_1 obj_04 obj_10)
(pred_1 obj_03 obj_10)
(pred_1 obj_02 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_07 ?b obj_05))))
)
)