(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_08 obj_05 - type_1
obj_09 obj_03 obj_01 obj_07 - type_2
obj_02 obj_10 obj_06 - object)
(:init
(pred_3 obj_04 obj_01)
(pred_4 obj_04 obj_08)
(pred_4 obj_04 obj_05)
(pred_1 obj_02 obj_07)
(pred_1 obj_10 obj_07)
(pred_1 obj_06 obj_03)
)
(:goal
(and
(pred_1 obj_02 obj_01)
(pred_1 obj_10 obj_09)
(pred_1 obj_06 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_04 ?b obj_05))))
)
)