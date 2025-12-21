(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_05 obj_03 - type_2
obj_10 obj_09 obj_01 obj_07 - type_3
obj_06 obj_04 obj_02 - object)
(:init
(pred_1 obj_08 obj_07)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_03)
(pred_2 obj_06 obj_10)
(pred_2 obj_04 obj_07)
(pred_2 obj_02 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_09)
(pred_2 obj_04 obj_07)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_05))))
)
)