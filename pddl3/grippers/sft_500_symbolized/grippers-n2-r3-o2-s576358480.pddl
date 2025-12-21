(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_1
obj_01 obj_09 obj_11 obj_08 - type_2
obj_10 obj_07 obj_05 - type_3
obj_04 obj_06 - object)
(:init
(pred_1 obj_02 obj_10)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_09)
(pred_1 obj_03 obj_05)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_08)
(pred_2 obj_04 obj_07)
(pred_2 obj_06 obj_05)
)
(:goal
(and
(pred_2 obj_04 obj_07)
(pred_2 obj_06 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_10) (pred_1 obj_03 obj_10))))
  )
)
)